using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LayoutEg.Startup))]
namespace LayoutEg
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
