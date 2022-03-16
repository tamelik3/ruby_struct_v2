#!/usr/bin/env ruby
#
#  test.rb - Yonix.eu Software Development Division
#
#  Copyright 1999-2021 YONIX.EU S.D.D. <francesco@yonix.eu>
#  Tutti i diritti sono riservati.
#
#  Questo programma NON E' free software, non e' possibile redistribuirlo,
#  modificarlo o fare qualunque altra cosa ammessa con il free software.
#
#  Questo software e' sviluppato da Yonix.eu S.D.D. Attualmente si trova in
#  fare di sviluppo. Per questo motivo non puo' essere utilizzato o testato.
#
#  Nessuno: persona, ente, azienda, pubblica amministrazione o altro, che
#  non sia stato espressamente autorizzato da Yonix.eu mediante lettera o
#  incarico dato solo in forma scritta puo' visionare questo software.
#
#  Questo software e' proprieta' intellettuale di yonix.eu protetto dalla
#  vigente legislazione sul diritto d'autore. Ogni trasgressione verra'
#  perseguita con ogni mezzo possibile al fine di recuperare ogni danno.
#
#  Chiunque legga questo messaggio e sia a conoscenza di un uso illecito del
#  software sviluppato da Yonix.eu oppure di qualunque altro uso fatto senza
#  il preventivo consenso scritto da parte di Yonix.eu viene incoraggiato ad
#  informare immediatamente Yonix.eu al fine di fare rispettare ogni diritto
#  garantito dalla Normativa vigente sulla proprieta' intellettuale.
#
#  Ogni aiuto che Yonix.eu ricevera' sara' gradito e ricompensato.
#  Francesco Cilona - Yonix.eu - Italia.
#

require 'sinatra'
require 'sinatra/reloader'
require 'sequel'
require 'time'


# Require dei files delle LIBRERIE not needed now
# Dir["./lib/*.rb"].each {|file| require file }


# Require CONFIGURATION FILESI
Dir["./conf/*.rb"].each {|file| require file }

# Require ROUTES files
Dir["./routes/*.rb"].each {|file| require file }

# Require MODULES files
Dir["./modules/*.rb"].each {|file| load file }

# Require MODELS files
Dir["./models/*.rb"].each {|file| load file }

# Require CONTROLLERS files
Dir["./controllers/*.rb"].each {|file| load file }

