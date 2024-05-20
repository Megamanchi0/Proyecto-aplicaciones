using ServiciosTaller.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServiciosTaller.Clases
{
    public class clsCargo
    {
        private DBTallerCarrosEntities taller = new DBTallerCarrosEntities();

        public List<Cargo> consultarCargos()
        {
            return taller.Cargoes.ToList();
        }
    }
}