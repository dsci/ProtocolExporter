=begin
** Form generated from reading ui file 'about_window.ui'
**
** Created: Mon Aug 18 13:52:48 2008
**      by: Qt User Interface Compiler version 4.3.1
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_Dialog
    attr_reader :buttonBox
    attr_reader :textEdit

    def setupUi(dialog)
    dialog.setObjectName("dialog")
    @buttonBox = Qt::DialogButtonBox.new(dialog)
    @buttonBox.setObjectName("buttonBox")
    @buttonBox.setGeometry(Qt::Rect.new(180, 360, 341, 32))
    @buttonBox.setOrientation(Qt::Horizontal)
    @buttonBox.setStandardButtons(Qt::DialogButtonBox::Ok)
    @textEdit = Qt::TextEdit.new(dialog)
    @textEdit.setObjectName("textEdit")
    @textEdit.setGeometry(Qt::Rect.new(10, 10, 511, 341))

    retranslateUi(dialog)

    size = Qt::Size.new(531, 406)
    size = size.expandedTo(dialog.minimumSizeHint())
    dialog.resize(size)

    Qt::Object.connect(@buttonBox, SIGNAL('accepted()'), dialog, SLOT('accept()'))
    Qt::Object.connect(@buttonBox, SIGNAL('rejected()'), dialog, SLOT('reject()'))

    Qt::MetaObject.connectSlotsByName(dialog)
    end # setupUi

    def setup_ui(dialog)
        setupUi(dialog)
    end

    def retranslateUi(dialog)
    dialog.setWindowTitle(Qt::Application.translate("Dialog", "Dialog", nil, Qt::Application::UnicodeUTF8))
    end # retranslateUi

    def retranslate_ui(dialog)
        retranslateUi(dialog)
    end

end

module Ui
    class Dialog < Ui_Dialog
    end
end  # module Ui

