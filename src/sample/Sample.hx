package sample;
import cpp.Pointer;
import qt.core.QFont.Font;
import qt.widgets.QApplication.Application;
import qt.widgets.QLabel.Label;
import qt.widgets.QMainWindow.MainWindow;
import qt.widgets.QMenu.Menu;
import qt.widgets.QPushButton;
import qt.widgets.QPushButton.PushButton;
import qt.widgets.QWidget.Widget;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */

@:build(qt.HxQt.setup("E:/SDKs/QT/5.9/msvc2017_64", ["Qt5Core", "Qt5Widgets" , "Qt5Gui"]))

class Sample
{
    private var app:Application;
    private var mainWindow:MainWindow;
    private var fileMenu:Menu;
    
    public function new()
    {
        app = new Application();
        app.setStyleSheet('
            QWidget#mywidget {
                background: #ffffff;
            }
            QPushButton#mybtn {
                padding:4px;
                color: #fff;
                font-size: 14px;
                border-radius: 10px;
                border: 1px solid #3873d9;
                background-color: qlineargradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #4287ff, stop: 1 #356ccc);
            }
            QPushButton#mybtn:pressed {
                color: #111;
                border: 1px solid #3873d9;
                background: #fff;
            }
        ');
        
        mainWindow = new MainWindow();
        mainWindow.setWindowTitle("Sample window");
        mainWindow.resize(640, 480);
        mainWindow.show();
        
        fileMenu = mainWindow.menuBar().addMenu("File");
        fileMenu.addAction("New");
        fileMenu.addAction("Open");
        fileMenu.addSeparator();
        fileMenu.addAction("Save");
        fileMenu.addAction("Save As");
        fileMenu.addAction("Save All");
        
        var window:Widget = new Widget();
        window.resize(300, 180);
        window.setWindowTitle("Haxe + Qt");
        window.setObjectName("mywidget");
        mainWindow.setCentralWidget(window);
        
        var btn:PushButton = new PushButton();
        btn.setObjectName("mybtn");
        btn.setText("Nice Button");
        btn.setGeometry(100, 100, 100, 50);
        btn.setParent(window);
        
        //weird untyped stuff for signal and slot:
        var _btn:Pointer<QPushButton> = @:privateAccess btn.ref.reinterpret();
        untyped __cpp__ ('QObject::connect(_btn->ptr, &QPushButton::clicked, [=](){  this->clickHandler(); })');
        
        var font:Font = new Font();
        font.setBold(true);
        font.setPointSize(25);
        
        var label:Label = new Label();
        label.setText(" Haxe is awesome!");
        label.setParent(window);
        label.setFont(font);
        
        window.show();
        app.exec();
    }
    
    public function clickHandler():Void
    {
        trace("I'm a slot.");
    }
}