using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RemoteValidationEg.Startup))]
namespace RemoteValidationEg
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
