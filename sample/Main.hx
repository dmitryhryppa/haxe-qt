package;
import qt.widgets.Widget;
import qt.widgets.Application;
import qt.widgets.MainWindow;
import qt.widgets.Menu;
import qt.widgets.PushButton;
import qt.widgets.Label;
import qt.core.Font;

//set path tto your Qt folder
@:build(qt.HxQt.setup("E:/SDKs/QT/5.9/msvc2017_64", ["Qt5Core", "Qt5Widgets" , "Qt5Gui"]))
class Main {
    public static function main():Void {
        var app:Application = new Application();
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

        var mainWindow:MainWindow = new MainWindow();
        mainWindow.setWindowTitle("Sample window");
        mainWindow.resize(640, 480);
        mainWindow.show();
        
        var fileMenu:Menu = mainWindow.menuBar().addMenu("File");
        fileMenu.addAction("New");
        fileMenu.addAction("Open");
        fileMenu.addSeparator();
        fileMenu.addAction("Save");
        fileMenu.addAction("Save As");
        fileMenu.addAction("Save All");
        
        var window:Widget = new Widget();
        window.setObjectName("mywidget");
        mainWindow.setCentralWidget(window);
        
        var btn:PushButton = new PushButton();
        btn.setObjectName("mybtn");
        btn.setText("Nice Button");
        btn.setGeometry(100, 100, 100, 50);
        btn.setParent(window);
        
        var secondWidget:Widget = new Widget();
        secondWidget.setWindowTitle("popup window");
        secondWidget.resize(500, 500);
        
        btn.clicked(function():Void {
            secondWidget.show();
        });

        var font:Font = new Font();
        font.setBold(true);
        font.setPointSize(25);
        
        var label:Label = new Label();
        label.setText(" Haxe is awesome!");
        label.setParent(window);
        label.setFont(font);

        app.exec();
    }
}