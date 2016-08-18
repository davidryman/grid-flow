noflo = require 'noflo'

exports.getComponent = ->
  c = new noflo.Component
  c.description = 'Forwards packets receives them'
  c.icon = 'forward'
  c.inPorts.add 'in',
    datatype: 'all'
    description: 'Packet to forward'
  c.outPorts.add 'out',
    datatype: 'all'

  noflo.helpers.WirePattern c,
    in: ['in']
    out: 'out'
    forwardGroups: true
    async: true
  , (data, groups, out, callback) ->
    # do something with data
    alert("Hello there")
    # send it on outport
    out.send data

    # let WirePattern know we are done
    do callback
  c