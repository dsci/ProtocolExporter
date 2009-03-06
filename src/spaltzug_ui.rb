=begin
** Form generated from reading ui file 'spaltzug.ui'
**
** Created: Mon Jun 30 16:05:59 2008
**      by: Qt User Interface Compiler version 4.3.1
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_Form
    attr_reader :qgridLayout
    attr_reader :qgridLayout1
    attr_reader :groupBox
    attr_reader :qgridLayout2
    attr_reader :label
    attr_reader :lieferwerkEdit
    attr_reader :label_2
    attr_reader :firmaEdit
    attr_reader :label_3
    attr_reader :baustelleEdit
    attr_reader :groupBox_2
    attr_reader :qgridLayout3
    attr_reader :label_4
    attr_reader :spacerItem
    attr_reader :pkNrEdit
    attr_reader :label_5
    attr_reader :betonFestBox
    attr_reader :label_6
    attr_reader :betonsorteEdit
    attr_reader :label_7
    attr_reader :lieferscheinEdit
    attr_reader :label_8
    attr_reader :hstDatumEdit
    attr_reader :label_9
    attr_reader :bauteilEdit
    attr_reader :label_10
    attr_reader :sollAlterBox
    attr_reader :groupBox_3
    attr_reader :qgridLayout4
    attr_reader :label_11
    attr_reader :lufttempEdit
    attr_reader :label_18
    attr_reader :volumenEdit
    attr_reader :label_12
    attr_reader :betontempEdit
    attr_reader :label_19
    attr_reader :rohEdit
    attr_reader :label_13
    attr_reader :ausbreitEdit
    attr_reader :label_20
    attr_reader :luftgehaltEdit
    attr_reader :label_14
    attr_reader :verdichtmassEdit
    attr_reader :label_21
    attr_reader :lagerungWEdit
    attr_reader :label_15
    attr_reader :verdichtTypEdit
    attr_reader :label_22
    attr_reader :lagerungLEdit
    attr_reader :label_16
    attr_reader :verdichtDauerEdit
    attr_reader :label_17
    attr_reader :masseFBEdit
    attr_reader :groupBox_4
    attr_reader :qgridLayout5
    attr_reader :label_23
    attr_reader :prfBNrEdit
    attr_reader :label_24
    attr_reader :einliefDatEdit
    attr_reader :label_25
    attr_reader :annehmEdit
    attr_reader :label_26
    attr_reader :lagerWEdit
    attr_reader :label_36
    attr_reader :lagerLEdit
    attr_reader :label_28
    attr_reader :prfDatEdit
    attr_reader :label_29
    attr_reader :istalterEdit
    attr_reader :label_30
    attr_reader :ebenflEdit
    attr_reader :label_31
    attr_reader :lengthEdit
    attr_reader :widthEdit
    attr_reader :heightEdit
    attr_reader :label_32
    attr_reader :weightEdit
    attr_reader :label_33
    attr_reader :volumeEdit
    attr_reader :label_34
    attr_reader :rohFestEdit
    attr_reader :label_35
    attr_reader :lineEdit_33
    attr_reader :widget
    attr_reader :qgridLayout6
    attr_reader :spacerItem1
    attr_reader :spaltzugAdd
    attr_reader :spaltzugExport

    def setupUi(form)
    form.setObjectName("form")
    @qgridLayout = Qt::GridLayout.new(form)
    @qgridLayout.setObjectName("qgridLayout")
    @qgridLayout1 = Qt::GridLayout.new()
    @qgridLayout1.setObjectName("qgridLayout1")
    @groupBox = Qt::GroupBox.new(form)
    @groupBox.setObjectName("groupBox")
    @qgridLayout2 = Qt::GridLayout.new(@groupBox)
    @qgridLayout2.setObjectName("qgridLayout2")
    @label = Qt::Label.new(@groupBox)
    @label.setObjectName("label")

    @qgridLayout2.addWidget(@label, 0, 0, 1, 1)

    @lieferwerkEdit = Qt::LineEdit.new(@groupBox)
    @lieferwerkEdit.setObjectName("lieferwerkEdit")

    @qgridLayout2.addWidget(@lieferwerkEdit, 0, 1, 1, 1)

    @label_2 = Qt::Label.new(@groupBox)
    @label_2.setObjectName("label_2")

    @qgridLayout2.addWidget(@label_2, 0, 2, 1, 1)

    @firmaEdit = Qt::LineEdit.new(@groupBox)
    @firmaEdit.setObjectName("firmaEdit")

    @qgridLayout2.addWidget(@firmaEdit, 0, 3, 1, 1)

    @label_3 = Qt::Label.new(@groupBox)
    @label_3.setObjectName("label_3")

    @qgridLayout2.addWidget(@label_3, 1, 0, 1, 1)

    @baustelleEdit = Qt::LineEdit.new(@groupBox)
    @baustelleEdit.setObjectName("baustelleEdit")

    @qgridLayout2.addWidget(@baustelleEdit, 1, 1, 1, 3)


    @qgridLayout1.addWidget(@groupBox, 0, 0, 1, 2)

    @groupBox_2 = Qt::GroupBox.new(form)
    @groupBox_2.setObjectName("groupBox_2")
    @qgridLayout3 = Qt::GridLayout.new(@groupBox_2)
    @qgridLayout3.setObjectName("qgridLayout3")
    @label_4 = Qt::Label.new(@groupBox_2)
    @label_4.setObjectName("label_4")

    @qgridLayout3.addWidget(@label_4, 0, 0, 1, 1)

    @spacerItem = Qt::SpacerItem.new(81, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @qgridLayout3.addItem(@spacerItem, 0, 1, 1, 1)

    @pkNrEdit = Qt::LineEdit.new(@groupBox_2)
    @pkNrEdit.setObjectName("pkNrEdit")

    @qgridLayout3.addWidget(@pkNrEdit, 0, 2, 1, 1)

    @label_5 = Qt::Label.new(@groupBox_2)
    @label_5.setObjectName("label_5")

    @qgridLayout3.addWidget(@label_5, 1, 0, 1, 1)

    @betonFestBox = Qt::ComboBox.new(@groupBox_2)
    @betonFestBox.setObjectName("betonFestBox")

    @qgridLayout3.addWidget(@betonFestBox, 1, 2, 1, 1)

    @label_6 = Qt::Label.new(@groupBox_2)
    @label_6.setObjectName("label_6")

    @qgridLayout3.addWidget(@label_6, 2, 0, 1, 1)

    @betonsorteEdit = Qt::LineEdit.new(@groupBox_2)
    @betonsorteEdit.setObjectName("betonsorteEdit")

    @qgridLayout3.addWidget(@betonsorteEdit, 2, 2, 1, 1)

    @label_7 = Qt::Label.new(@groupBox_2)
    @label_7.setObjectName("label_7")

    @qgridLayout3.addWidget(@label_7, 3, 0, 1, 1)

    @lieferscheinEdit = Qt::LineEdit.new(@groupBox_2)
    @lieferscheinEdit.setObjectName("lieferscheinEdit")

    @qgridLayout3.addWidget(@lieferscheinEdit, 3, 2, 1, 1)

    @label_8 = Qt::Label.new(@groupBox_2)
    @label_8.setObjectName("label_8")

    @qgridLayout3.addWidget(@label_8, 4, 0, 1, 1)

    @hstDatumEdit = Qt::LineEdit.new(@groupBox_2)
    @hstDatumEdit.setObjectName("hstDatumEdit")

    @qgridLayout3.addWidget(@hstDatumEdit, 4, 2, 1, 1)

    @label_9 = Qt::Label.new(@groupBox_2)
    @label_9.setObjectName("label_9")

    @qgridLayout3.addWidget(@label_9, 5, 0, 1, 1)

    @bauteilEdit = Qt::LineEdit.new(@groupBox_2)
    @bauteilEdit.setObjectName("bauteilEdit")

    @qgridLayout3.addWidget(@bauteilEdit, 5, 2, 1, 1)

    @label_10 = Qt::Label.new(@groupBox_2)
    @label_10.setObjectName("label_10")

    @qgridLayout3.addWidget(@label_10, 6, 0, 1, 1)

    @sollAlterBox = Qt::ComboBox.new(@groupBox_2)
    @sollAlterBox.setObjectName("sollAlterBox")

    @qgridLayout3.addWidget(@sollAlterBox, 6, 2, 1, 1)


    @qgridLayout1.addWidget(@groupBox_2, 1, 0, 1, 1)

    @groupBox_3 = Qt::GroupBox.new(form)
    @groupBox_3.setObjectName("groupBox_3")
    @qgridLayout4 = Qt::GridLayout.new(@groupBox_3)
    @qgridLayout4.setObjectName("qgridLayout4")
    @label_11 = Qt::Label.new(@groupBox_3)
    @label_11.setObjectName("label_11")

    @qgridLayout4.addWidget(@label_11, 0, 0, 1, 1)

    @lufttempEdit = Qt::LineEdit.new(@groupBox_3)
    @lufttempEdit.setObjectName("lufttempEdit")

    @qgridLayout4.addWidget(@lufttempEdit, 0, 1, 1, 1)

    @label_18 = Qt::Label.new(@groupBox_3)
    @label_18.setObjectName("label_18")

    @qgridLayout4.addWidget(@label_18, 0, 2, 1, 1)

    @volumenEdit = Qt::LineEdit.new(@groupBox_3)
    @volumenEdit.setObjectName("volumenEdit")

    @qgridLayout4.addWidget(@volumenEdit, 0, 3, 1, 1)

    @label_12 = Qt::Label.new(@groupBox_3)
    @label_12.setObjectName("label_12")

    @qgridLayout4.addWidget(@label_12, 1, 0, 1, 1)

    @betontempEdit = Qt::LineEdit.new(@groupBox_3)
    @betontempEdit.setObjectName("betontempEdit")

    @qgridLayout4.addWidget(@betontempEdit, 1, 1, 1, 1)

    @label_19 = Qt::Label.new(@groupBox_3)
    @label_19.setObjectName("label_19")

    @qgridLayout4.addWidget(@label_19, 1, 2, 1, 1)

    @rohEdit = Qt::LineEdit.new(@groupBox_3)
    @rohEdit.setObjectName("rohEdit")

    @qgridLayout4.addWidget(@rohEdit, 1, 3, 1, 1)

    @label_13 = Qt::Label.new(@groupBox_3)
    @label_13.setObjectName("label_13")

    @qgridLayout4.addWidget(@label_13, 2, 0, 1, 1)

    @ausbreitEdit = Qt::LineEdit.new(@groupBox_3)
    @ausbreitEdit.setObjectName("ausbreitEdit")

    @qgridLayout4.addWidget(@ausbreitEdit, 2, 1, 1, 1)

    @label_20 = Qt::Label.new(@groupBox_3)
    @label_20.setObjectName("label_20")

    @qgridLayout4.addWidget(@label_20, 2, 2, 1, 1)

    @luftgehaltEdit = Qt::LineEdit.new(@groupBox_3)
    @luftgehaltEdit.setObjectName("luftgehaltEdit")

    @qgridLayout4.addWidget(@luftgehaltEdit, 2, 3, 1, 1)

    @label_14 = Qt::Label.new(@groupBox_3)
    @label_14.setObjectName("label_14")

    @qgridLayout4.addWidget(@label_14, 3, 0, 1, 1)

    @verdichtmassEdit = Qt::LineEdit.new(@groupBox_3)
    @verdichtmassEdit.setObjectName("verdichtmassEdit")

    @qgridLayout4.addWidget(@verdichtmassEdit, 3, 1, 1, 1)

    @label_21 = Qt::Label.new(@groupBox_3)
    @label_21.setObjectName("label_21")

    @qgridLayout4.addWidget(@label_21, 3, 2, 1, 1)

    @lagerungWEdit = Qt::LineEdit.new(@groupBox_3)
    @lagerungWEdit.setObjectName("lagerungWEdit")

    @qgridLayout4.addWidget(@lagerungWEdit, 3, 3, 1, 1)

    @label_15 = Qt::Label.new(@groupBox_3)
    @label_15.setObjectName("label_15")

    @qgridLayout4.addWidget(@label_15, 4, 0, 1, 1)

    @verdichtTypEdit = Qt::LineEdit.new(@groupBox_3)
    @verdichtTypEdit.setObjectName("verdichtTypEdit")

    @qgridLayout4.addWidget(@verdichtTypEdit, 4, 1, 1, 1)

    @label_22 = Qt::Label.new(@groupBox_3)
    @label_22.setObjectName("label_22")

    @qgridLayout4.addWidget(@label_22, 4, 2, 1, 1)

    @lagerungLEdit = Qt::LineEdit.new(@groupBox_3)
    @lagerungLEdit.setObjectName("lagerungLEdit")

    @qgridLayout4.addWidget(@lagerungLEdit, 4, 3, 1, 1)

    @label_16 = Qt::Label.new(@groupBox_3)
    @label_16.setObjectName("label_16")

    @qgridLayout4.addWidget(@label_16, 5, 0, 1, 1)

    @verdichtDauerEdit = Qt::LineEdit.new(@groupBox_3)
    @verdichtDauerEdit.setObjectName("verdichtDauerEdit")

    @qgridLayout4.addWidget(@verdichtDauerEdit, 5, 1, 1, 1)

    @label_17 = Qt::Label.new(@groupBox_3)
    @label_17.setObjectName("label_17")

    @qgridLayout4.addWidget(@label_17, 6, 0, 1, 1)

    @masseFBEdit = Qt::LineEdit.new(@groupBox_3)
    @masseFBEdit.setObjectName("masseFBEdit")

    @qgridLayout4.addWidget(@masseFBEdit, 6, 1, 1, 1)


    @qgridLayout1.addWidget(@groupBox_3, 1, 1, 1, 1)

    @groupBox_4 = Qt::GroupBox.new(form)
    @groupBox_4.setObjectName("groupBox_4")
    @qgridLayout5 = Qt::GridLayout.new(@groupBox_4)
    @qgridLayout5.setObjectName("qgridLayout5")
    @label_23 = Qt::Label.new(@groupBox_4)
    @label_23.setObjectName("label_23")

    @qgridLayout5.addWidget(@label_23, 0, 0, 1, 1)

    @prfBNrEdit = Qt::LineEdit.new(@groupBox_4)
    @prfBNrEdit.setObjectName("prfBNrEdit")

    @qgridLayout5.addWidget(@prfBNrEdit, 0, 2, 1, 3)

    @label_24 = Qt::Label.new(@groupBox_4)
    @label_24.setObjectName("label_24")

    @qgridLayout5.addWidget(@label_24, 0, 5, 1, 4)

    @einliefDatEdit = Qt::LineEdit.new(@groupBox_4)
    @einliefDatEdit.setObjectName("einliefDatEdit")

    @qgridLayout5.addWidget(@einliefDatEdit, 0, 9, 1, 3)

    @label_25 = Qt::Label.new(@groupBox_4)
    @label_25.setObjectName("label_25")

    @qgridLayout5.addWidget(@label_25, 0, 12, 1, 2)

    @annehmEdit = Qt::LineEdit.new(@groupBox_4)
    @annehmEdit.setObjectName("annehmEdit")
    @annehmEdit.setMaximumSize(Qt::Size.new(61, 20))

    @qgridLayout5.addWidget(@annehmEdit, 0, 14, 1, 2)

    @label_26 = Qt::Label.new(@groupBox_4)
    @label_26.setObjectName("label_26")

    @qgridLayout5.addWidget(@label_26, 0, 16, 1, 1)

    @lagerWEdit = Qt::LineEdit.new(@groupBox_4)
    @lagerWEdit.setObjectName("lagerWEdit")
    @lagerWEdit.setMaximumSize(Qt::Size.new(71, 20))

    @qgridLayout5.addWidget(@lagerWEdit, 0, 17, 1, 1)

    @label_36 = Qt::Label.new(@groupBox_4)
    @label_36.setObjectName("label_36")

    @qgridLayout5.addWidget(@label_36, 0, 18, 1, 1)

    @lagerLEdit = Qt::LineEdit.new(@groupBox_4)
    @lagerLEdit.setObjectName("lagerLEdit")
    @lagerLEdit.setMaximumSize(Qt::Size.new(71, 20))

    @qgridLayout5.addWidget(@lagerLEdit, 0, 19, 1, 1)

    @label_28 = Qt::Label.new(@groupBox_4)
    @label_28.setObjectName("label_28")

    @qgridLayout5.addWidget(@label_28, 1, 0, 1, 1)

    @prfDatEdit = Qt::LineEdit.new(@groupBox_4)
    @prfDatEdit.setObjectName("prfDatEdit")

    @qgridLayout5.addWidget(@prfDatEdit, 1, 1, 1, 5)

    @label_29 = Qt::Label.new(@groupBox_4)
    @label_29.setObjectName("label_29")

    @qgridLayout5.addWidget(@label_29, 1, 6, 1, 2)

    @istalterEdit = Qt::LineEdit.new(@groupBox_4)
    @istalterEdit.setObjectName("istalterEdit")
    @istalterEdit.setMaximumSize(Qt::Size.new(41, 20))

    @qgridLayout5.addWidget(@istalterEdit, 1, 8, 1, 2)

    @label_30 = Qt::Label.new(@groupBox_4)
    @label_30.setObjectName("label_30")

    @qgridLayout5.addWidget(@label_30, 1, 10, 1, 2)

    @ebenflEdit = Qt::LineEdit.new(@groupBox_4)
    @ebenflEdit.setObjectName("ebenflEdit")

    @qgridLayout5.addWidget(@ebenflEdit, 1, 12, 1, 5)

    @label_31 = Qt::Label.new(@groupBox_4)
    @label_31.setObjectName("label_31")

    @qgridLayout5.addWidget(@label_31, 2, 0, 1, 2)

    @lengthEdit = Qt::LineEdit.new(@groupBox_4)
    @lengthEdit.setObjectName("lengthEdit")
    @lengthEdit.setMaximumSize(Qt::Size.new(31, 20))

    @qgridLayout5.addWidget(@lengthEdit, 2, 2, 1, 1)

    @widthEdit = Qt::LineEdit.new(@groupBox_4)
    @widthEdit.setObjectName("widthEdit")
    @widthEdit.setMaximumSize(Qt::Size.new(31, 20))

    @qgridLayout5.addWidget(@widthEdit, 2, 3, 1, 1)

    @heightEdit = Qt::LineEdit.new(@groupBox_4)
    @heightEdit.setObjectName("heightEdit")
    @heightEdit.setMaximumSize(Qt::Size.new(31, 20))

    @qgridLayout5.addWidget(@heightEdit, 2, 4, 1, 2)

    @label_32 = Qt::Label.new(@groupBox_4)
    @label_32.setObjectName("label_32")

    @qgridLayout5.addWidget(@label_32, 2, 6, 1, 1)

    @weightEdit = Qt::LineEdit.new(@groupBox_4)
    @weightEdit.setObjectName("weightEdit")
    @weightEdit.setMaximumSize(Qt::Size.new(61, 20))

    @qgridLayout5.addWidget(@weightEdit, 2, 7, 1, 3)

    @label_33 = Qt::Label.new(@groupBox_4)
    @label_33.setObjectName("label_33")

    @qgridLayout5.addWidget(@label_33, 2, 10, 1, 1)

    @volumeEdit = Qt::LineEdit.new(@groupBox_4)
    @volumeEdit.setObjectName("volumeEdit")
    @volumeEdit.setMaximumSize(Qt::Size.new(71, 20))

    @qgridLayout5.addWidget(@volumeEdit, 2, 11, 1, 2)

    @label_34 = Qt::Label.new(@groupBox_4)
    @label_34.setObjectName("label_34")

    @qgridLayout5.addWidget(@label_34, 2, 13, 1, 2)

    @rohFestEdit = Qt::LineEdit.new(@groupBox_4)
    @rohFestEdit.setObjectName("rohFestEdit")

    @qgridLayout5.addWidget(@rohFestEdit, 2, 15, 1, 2)

    @label_35 = Qt::Label.new(@groupBox_4)
    @label_35.setObjectName("label_35")
    @font = Qt::Font.new
    @font.setPointSize(14)
    @font.setBold(true)
    @font.setWeight(75)
    @label_35.setFont(@font)
    @label_35.setStyleSheet("color:red;")

    @qgridLayout5.addWidget(@label_35, 3, 0, 1, 1)

    @lineEdit_33 = Qt::LineEdit.new(@groupBox_4)
    @lineEdit_33.setObjectName("lineEdit_33")
    @lineEdit_33.setMaximumSize(Qt::Size.new(101, 20))

    @qgridLayout5.addWidget(@lineEdit_33, 3, 1, 1, 4)


    @qgridLayout1.addWidget(@groupBox_4, 2, 0, 1, 2)

    @widget = Qt::Widget.new(form)
    @widget.setObjectName("widget")
    @qgridLayout6 = Qt::GridLayout.new(@widget)
    @qgridLayout6.setObjectName("qgridLayout6")
    @spacerItem1 = Qt::SpacerItem.new(698, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @qgridLayout6.addItem(@spacerItem1, 0, 0, 1, 1)

    @spaltzugAdd = Qt::PushButton.new(@widget)
    @spaltzugAdd.setObjectName("spaltzugAdd")

    @qgridLayout6.addWidget(@spaltzugAdd, 0, 1, 1, 1)

    @spaltzugExport = Qt::PushButton.new(@widget)
    @spaltzugExport.setObjectName("spaltzugExport")

    @qgridLayout6.addWidget(@spaltzugExport, 0, 2, 1, 1)


    @qgridLayout1.addWidget(@widget, 3, 0, 1, 2)


    @qgridLayout.addLayout(@qgridLayout1, 0, 0, 1, 1)


    retranslateUi(form)

    size = Qt::Size.new(885, 512)
    size = size.expandedTo(form.minimumSizeHint())
    form.resize(size)


    Qt::MetaObject.connectSlotsByName(form)
    end # setupUi

    def setup_ui(form)
        setupUi(form)
    end

    def retranslateUi(form)
    form.setWindowTitle(Qt::Application.translate("Form", "Form", nil, Qt::Application::UnicodeUTF8))
    @groupBox.setTitle(Qt::Application.translate("Form", "Allgemeine Angaben", nil, Qt::Application::UnicodeUTF8))
    @label.setText(Qt::Application.translate("Form", "TB-Lieferwerk", nil, Qt::Application::UnicodeUTF8))
    @label_2.setText(Qt::Application.translate("Form", "Firma / Niederlassung", nil, Qt::Application::UnicodeUTF8))
    @label_3.setText(Qt::Application.translate("Form", "Baustelle", nil, Qt::Application::UnicodeUTF8))
    @groupBox_2.setTitle(Qt::Application.translate("Form", "Probeentnahme", nil, Qt::Application::UnicodeUTF8))
    @label_4.setText(Qt::Application.translate("Form", "Pk-Nr.", nil, Qt::Application::UnicodeUTF8))
    @label_5.setText(Qt::Application.translate("Form", "Betonfestigkeitsklasse", nil, Qt::Application::UnicodeUTF8))
    @betonFestBox.clear()
    @betonFestBox.addItem(Qt::Application.translate("Form", "C 20/25", nil, Qt::Application::UnicodeUTF8))
    @betonFestBox.addItem(Qt::Application.translate("Form", "C 30/37", nil, Qt::Application::UnicodeUTF8))
    @betonFestBox.addItem(Qt::Application.translate("Form", "C 40/45", nil, Qt::Application::UnicodeUTF8))
    @label_6.setText(Qt::Application.translate("Form", "Betonsorte", nil, Qt::Application::UnicodeUTF8))
    @label_7.setText(Qt::Application.translate("Form", "Lieferschein-Nr", nil, Qt::Application::UnicodeUTF8))
    @label_8.setText(Qt::Application.translate("Form", "Herstelldatum", nil, Qt::Application::UnicodeUTF8))
    @label_9.setText(Qt::Application.translate("Form", "Bauteil", nil, Qt::Application::UnicodeUTF8))
    @label_10.setText(Qt::Application.translate("Form", "Sollalter", nil, Qt::Application::UnicodeUTF8))
    @sollAlterBox.clear()
    @sollAlterBox.addItem(Qt::Application.translate("Form", "7", nil, Qt::Application::UnicodeUTF8))
    @sollAlterBox.addItem(Qt::Application.translate("Form", "28", nil, Qt::Application::UnicodeUTF8))
    @sollAlterBox.addItem(Qt::Application.translate("Form", "56", nil, Qt::Application::UnicodeUTF8))
    @sollAlterBox.addItem(Qt::Application.translate("Form", "90", nil, Qt::Application::UnicodeUTF8))
    @groupBox_3.setTitle(Qt::Application.translate("Form", "Frischbeton", nil, Qt::Application::UnicodeUTF8))
    @label_11.setText(Qt::Application.translate("Form", "Lufttemperatur", nil, Qt::Application::UnicodeUTF8))
    @label_18.setText(Qt::Application.translate("Form", "Volumen (Form)", nil, Qt::Application::UnicodeUTF8))
    @label_12.setText(Qt::Application.translate("Form", "Frischbetontemperatur", nil, Qt::Application::UnicodeUTF8))
    @label_19.setText(Qt::Application.translate("Form", "Rohdichte", nil, Qt::Application::UnicodeUTF8))
    @label_13.setText(Qt::Application.translate("Form", "Ausbreitmass", nil, Qt::Application::UnicodeUTF8))
    @label_20.setText(Qt::Application.translate("Form", "Luftgehalt", nil, Qt::Application::UnicodeUTF8))
    @label_14.setText(Qt::Application.translate("Form", "Verdichtungsmass", nil, Qt::Application::UnicodeUTF8))
    @label_21.setText(Qt::Application.translate("Form", "Lagerung(Wasser)", nil, Qt::Application::UnicodeUTF8))
    @label_15.setText(Qt::Application.translate("Form", "Verdichtungsgeraet", nil, Qt::Application::UnicodeUTF8))
    @label_22.setText(Qt::Application.translate("Form", "Lagerung(Luft)", nil, Qt::Application::UnicodeUTF8))
    @label_16.setText(Qt::Application.translate("Form", "Verdichtungsdauer", nil, Qt::Application::UnicodeUTF8))
    @label_17.setText(Qt::Application.translate("Form", "Masse Form+Beton", nil, Qt::Application::UnicodeUTF8))
    @groupBox_4.setTitle(Qt::Application.translate("Form", "Festbeton", nil, Qt::Application::UnicodeUTF8))
    @label_23.setText(Qt::Application.translate("Form", "Pruefbuchnummer", nil, Qt::Application::UnicodeUTF8))
    @label_24.setText(Qt::Application.translate("Form", "Einlieferungsdatum", nil, Qt::Application::UnicodeUTF8))
    @label_25.setText(Qt::Application.translate("Form", "Annehmender", nil, Qt::Application::UnicodeUTF8))
    @label_26.setText(Qt::Application.translate("Form", "Lagerung in Wasser/Luft", nil, Qt::Application::UnicodeUTF8))
    @label_36.setText(Qt::Application.translate("Form", "/", nil, Qt::Application::UnicodeUTF8))
    @label_28.setText(Qt::Application.translate("Form", "Pruefdatum", nil, Qt::Application::UnicodeUTF8))
    @label_29.setText(Qt::Application.translate("Form", "Istalter", nil, Qt::Application::UnicodeUTF8))
    @label_30.setText(Qt::Application.translate("Form", "Ebenflaechigkeit", nil, Qt::Application::UnicodeUTF8))
    @label_31.setText(Qt::Application.translate("Form", "Laenge/Breite/Hoehe", nil, Qt::Application::UnicodeUTF8))
    @label_32.setText(Qt::Application.translate("Form", "Masse", nil, Qt::Application::UnicodeUTF8))
    @label_33.setText(Qt::Application.translate("Form", "Volumen", nil, Qt::Application::UnicodeUTF8))
    @label_34.setText(Qt::Application.translate("Form", "Rohdichte", nil, Qt::Application::UnicodeUTF8))
    @label_35.setText(Qt::Application.translate("Form", "Bruchlast", nil, Qt::Application::UnicodeUTF8))
    @spaltzugAdd.setText(Qt::Application.translate("Form", "Spaltzug", nil, Qt::Application::UnicodeUTF8))
    @spaltzugExport.setText(Qt::Application.translate("Form", "Exportieren", nil, Qt::Application::UnicodeUTF8))
    end # retranslateUi

    def retranslate_ui(form)
        retranslateUi(form)
    end

end

module Ui
    class Form < Ui_Form
    end
end  # module Ui

