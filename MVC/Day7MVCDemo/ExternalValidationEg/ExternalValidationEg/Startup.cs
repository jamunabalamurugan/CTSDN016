using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ExternalValidationEg.Startup))]
namespace ExternalValidationEg
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
