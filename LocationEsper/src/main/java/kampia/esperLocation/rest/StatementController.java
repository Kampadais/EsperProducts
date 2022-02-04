package kampia.esperLocation.rest;

import com.espertech.esper.common.client.EPCompiled;
import com.espertech.esper.common.client.EventBean;
import com.espertech.esper.common.client.configuration.Configuration;
import com.espertech.esper.runtime.client.EPDeployment;
import com.espertech.esper.runtime.client.EPRuntime;
import com.espertech.esper.runtime.client.EPRuntimeProvider;
import com.espertech.esper.runtime.client.EPStatement;
import kampia.esperLocation.config.EsperConfig;
import kampia.esperLocation.utils.EPLUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

import static kampia.esperLocation.config.EsperConfig.RUNTIME_URI;

@RestController
@RequestMapping("/api")
public class StatementController {

    private static final Logger log = LoggerFactory.getLogger(StatementController.class);

    // TODO: Works only for upcoming Events ...
    @PostMapping(value = "/statements", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity create(@Valid @RequestBody Statement statement) {
        Configuration configuration = EsperConfig.getConfiguration();
        EPRuntime runtime = EPRuntimeProvider.getRuntime(RUNTIME_URI, configuration);
        try {
            log.info("Got statement {}: {}", statement.getName(), statement.getStatement());
            EPCompiled compiled = EPLUtil.compileEPL(configuration, statement.getStatement(), statement.getName());

            EPDeployment deployment = EPLUtil.deploy(runtime, compiled);

            EPStatement s = runtime.getDeploymentService().getStatement(deployment.getDeploymentId(), statement.getName());
            s.addListener((newData, oldData, sta, run) -> {
                for (EventBean nd : newData) {
                    log.info("Read {} from Kafka using posted statement ({})", nd.toString(), statement.getName());
                }
            });
            return new ResponseEntity(HttpStatus.ACCEPTED);
        } catch (Exception e) {
            log.error("Could not compile statement", e);
            return new ResponseEntity(HttpStatus.NOT_ACCEPTABLE);
        }
    }
}
