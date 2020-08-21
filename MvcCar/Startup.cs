using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MvcCar.Startup))]
namespace MvcCar
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
