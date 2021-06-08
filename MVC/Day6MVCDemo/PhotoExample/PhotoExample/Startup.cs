using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PhotoExample.Startup))]
namespace PhotoExample
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
