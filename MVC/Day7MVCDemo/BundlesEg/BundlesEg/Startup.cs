using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BundlesEg.Startup))]
namespace BundlesEg
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
