package charType.utils.common.email;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

//@Configuration
public class EmailConfig {

    @Bean
    public JavaMailSender getMailSender() {
        
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);
        mailSender.setUsername("nks30000@naver.com");
        mailSender.setPassword("xbeqsfwljjkqfprf");
        
        Properties javaMailProperties = new Properties();
        
        javaMailProperties.put("mail.smtp.starttls.enable", "true");
        javaMailProperties.put("mail.smtp.auth", "true");
        javaMailProperties.put("mail.transport.protocol", "smtp");
        javaMailProperties.put("mail.debug", "true");
        javaMailProperties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        javaMailProperties.put("mail.smtp.ssl.protocols", "TLSv1.2");
 
        mailSender.setJavaMailProperties(javaMailProperties);
        
        return mailSender;
    }
}
