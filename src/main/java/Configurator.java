import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class Configurator implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        FilterRegistration.Dynamic registration = context.addFilter("colorFilter", new ColorFilter());
        registration.setAsyncSupported(true);
        registration.addMappingForUrlPatterns(null, false, "/welcome_page.jsp");
    }
}
