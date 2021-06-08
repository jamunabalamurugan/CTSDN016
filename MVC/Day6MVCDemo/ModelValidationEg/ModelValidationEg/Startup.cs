using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ModelValidationEg.Startup))]
namespace ModelValidationEg
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
