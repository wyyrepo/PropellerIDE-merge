
%Module(name=QHexEdit, version=1)

%Import QtCore/QtCoremod.sip
%Import QtGui/QtGuimod.sip

%If (Qt_5_0_0 -)
%Import QtWidgets/QtWidgetsmod.sip
%End

class QHexEditData : QObject
{
%TypeHeaderCode
#include <qhexeditdata.h>
%End

    public:
        enum ActionType { None = 0, Insert = 1, Remove = 2, Replace = 3 };

        QUndoStack* undoStack();
        qint64 length() const;
        bool isReadOnly() const;

    private:
        explicit QHexEditData(QIODevice* iodevice, QObject *parent = 0);
        ~QHexEditData();

    public slots:
        bool save();
        bool saveTo(QIODevice* iodevice);

    public:
        static QHexEditData* fromDevice(QIODevice* iodevice);
        static QHexEditData* fromFile(QString filename);
        static QHexEditData* fromMemory(const QByteArray& ba);

    signals:
        void dataChanged(qint64 offset, qint64 size, QHexEditData::ActionType reason);

};

class QHexEdit : QFrame
{
%TypeHeaderCode
#include <qhexedit.h>
%End

    public:
        explicit QHexEdit(QWidget * /TransferThis/ = 0);
        bool readOnly();
        int addressWidth();
        int visibleLinesCount();
        QHexEditData *data();
        qint64 indexOf(QByteArray &ba , qint64 start = 0);
        qint64 baseAddress();
        qint64 cursorPos();
        qint64 selectionStart();
        qint64 selectionEnd();
        qint64 selectionLength();
        qint64 visibleStartOffset();
        qint64 visibleEndOffset();

        void setFont(const QFont &f);
        void setLineColor(const QColor &c);
        void setHexColor(const QColor &c);
        void setAlternateHexColor(const QColor &c);
        void setHighlightColor(const QColor &c);
        void setAddressForeColor(const QColor &c);
        void setAddressBackColor(const QColor &c);
        void setAlternateLineColor(const QColor &c);

        void setBaseAddress(qint64 ba);

    signals:
        void visibleLinesChanged();
        void positionChanged(qint64 offset);
        void selectionChanged(qint64 length);
        void bytesChanged(qint64 pos);
        void verticalScrollBarValueChanged(int value);
        void widthChanged(int width);

    public slots:
        void undo();
        void redo();
        void cut();
        void copy();
        void copyHex();
        void paste();
        void pasteHex();
        void selectAll();
        void setReadOnly(bool);
        void setCursorPos(qint64 pos);
        void setData(QHexEditData *hexeditdata);
        void selectPos(qint64 pos);
        void setSelection(qint64 start, qint64 end);
        void setSelectionLength(qint64 start , qint64 length);
        void highlightBackground(qint64, qint64, const QColor &);
        void highlightForeground(qint64, qint64, const QColor &);
        void clearHighlight(qint64, qint64);
        void clearHighlight();
        void commentRange(qint64, qint64, const QString &);
        void uncommentRange(qint64, qint64);
        void clearComments();
        void setVerticalScrollBarValue(int);
        void scroll(QWheelEvent *);

};
