(setq texto (first *args*))

(setq texto (string-downcase texto))

(cond

 ;; FPS
 ((or
    (search "fps" texto)
    (search "disparos" texto)
    (search "shooter" texto))
  (princ "fps"))

 ;; MOBA
 ((or
    (search "moba" texto)
    (search "competitivos" texto))
  (princ "moba"))

 ;; CARRERAS
 ((or
    (search "carreras" texto)
    (search "coches" texto)
    (search "carros" texto)
    (search "autos" texto))
  (princ "carreras"))

 ;; DEPORTES
 ((or
    (search "deportes" texto)
    (search "futbol" texto)
    (search "basket" texto))
  (princ "deportes"))

 ;; TERROR
 ((or
    (search "terror" texto)
    (search "miedo" texto)
    (search "horror" texto))
  (princ "terror"))

 ;; RPG
 ((or
    (search "rpg" texto)
    (search "rol" texto))
  (princ "rpg"))

 ;; ACCION
 ((or
    (search "accion" texto)
    (search "peleas" texto))
  (princ "accion"))

 ;; SOULS
 ((or
    (search "souls" texto)
    (search "dificiles" texto)
    (search "retadores" texto))
  (princ "souls"))

 ;; RETRO
 ((or
    (search "retro" texto)
    (search "viejos" texto)
    (search "clasicos" texto)
    (search "viejitos" texto))
  (princ "retro"))

 ;; AVENTURA
 ((or
    (search "aventura" texto)
    (search "exploracion" texto))
  (princ "aventura"))

 ;; DEFAULT
 (t
  (princ "aventura"))
)