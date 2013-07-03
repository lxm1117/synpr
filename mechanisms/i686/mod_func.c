#include <stdio.h>
#include "hocdec.h"
extern int nrnmpi_myid;
extern int nrn_nobanner_;
modl_reg(){
  if (!nrn_nobanner_) if (nrnmpi_myid < 1) {
    fprintf(stderr, "Additional mechanisms from files\n");

    fprintf(stderr," ca.mod");
    fprintf(stderr," ca1AH.mod");
    fprintf(stderr," ca1N.mod");
    fprintf(stderr," caL3d.mod");
    fprintf(stderr," cad.mod");
    fprintf(stderr," cagk.mod");
    fprintf(stderr," cal2.mod");
    fprintf(stderr," can2.mod");
    fprintf(stderr," cat.mod");
    fprintf(stderr," expsyn2c.mod");
    fprintf(stderr," h.mod");
    fprintf(stderr," kadist.mod");
    fprintf(stderr," kaprox.mod");
    fprintf(stderr," kca.mod");
    fprintf(stderr," kdrca1.mod");
    fprintf(stderr," km.mod");
    fprintf(stderr," kv.mod");
    fprintf(stderr," na.mod");
    fprintf(stderr," na16.mod");
    fprintf(stderr," na3.mod");
    fprintf(stderr," nax.mod");
    fprintf(stderr, "\n");
  }
  _ca_reg();
  _ca1AH_reg();
  _ca1N_reg();
  _caL3d_reg();
  _cad_reg();
  _cagk_reg();
  _cal2_reg();
  _can2_reg();
  _cat_reg();
  _expsyn2c_reg();
  _h_reg();
  _kadist_reg();
  _kaprox_reg();
  _kca_reg();
  _kdrca1_reg();
  _km_reg();
  _kv_reg();
  _na_reg();
  _na16_reg();
  _na3_reg();
  _nax_reg();
}
