using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FluentValidationExample.Startup))]
namespace FluentValidationExample
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
