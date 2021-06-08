using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FiltersEg.Startup))]
namespace FiltersEg
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
