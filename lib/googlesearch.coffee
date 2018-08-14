Shell = require 'shell'

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'mbaidusearch:mbaidu-it': => @search()

  search: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    buffer.transact ->
      for selection in selections
        cased = selection.getText()
        url = "http://m.baidu.com/s?word=#{cased}"
        Shell.openExternal url
