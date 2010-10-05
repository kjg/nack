{createProcess} = require 'nack/process'
{createPool}    = require 'nack/pool'
{logStream}     = require 'nack/logger'

module.exports = (config, options) ->
  options ?= {}
  options.size ?= 3
  pool = createPool config, options
  (req, res, next) ->
    pool.proxyRequest req, res, (err) ->
      if err
        next err

module.exports.createProcess = createProcess
module.exports.createPool    = createPool
module.exports.logStream     = logStream
