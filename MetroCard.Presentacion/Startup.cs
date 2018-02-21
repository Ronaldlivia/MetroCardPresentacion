using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MetroCard.Presentacion.Startup))]
namespace MetroCard.Presentacion
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
