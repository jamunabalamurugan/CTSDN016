using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ViewswithButtons.Startup))]
namespace ViewswithButtons
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
