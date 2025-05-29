require 'irb/completion'
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = '~/.irb-history'
IRB.conf[:HISTORY_FILE] = ENV['IRB_HISTFILE'] if ENV['IRB_HISTFILE']
