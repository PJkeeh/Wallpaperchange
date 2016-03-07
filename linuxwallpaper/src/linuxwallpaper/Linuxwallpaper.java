package linuxwallpaper;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.File;
import javax.swing.*;
import java.net.URL;

/**
 *
 * @author Pieter Vandamme
 */
public class Linuxwallpaper extends JFrame {

    TrayIcon trayIcon;
    SystemTray tray;
    String path;

    private Linuxwallpaper() {
        super("Wallpapers");
        this.setVisible(false);
	
        URL location = Linuxwallpaper.class.getProtectionDomain().getCodeSource().getLocation();
					
	path = location.getPath();
	File f = new File(path);
        while(path.indexOf(".jar") != -1){
            f = f.getParentFile();
            path = f.getAbsolutePath();
       	}

        try {
            if (SystemTray.isSupported()) {
                tray = SystemTray.getSystemTray();

                Image image = new ImageIcon(ClassLoader.getSystemResource("linuxwallpaper/icon.png")).getImage();
                PopupMenu popup = new PopupMenu();
                MenuItem defaultItem = new MenuItem("Load Wallpapers");
                defaultItem.addActionListener(new ActionListener() {
                    public void actionPerformed(ActionEvent e) {
                        try {
                            ProcessBuilder pb = new ProcessBuilder(path + "/wallpapers.sh");
                            Process p = pb.start();
                            BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
                            String line = null;
                            while ((line = reader.readLine()) != null) {
                                System.out.println(line);
                            }
                        } catch (IOException ex) {
                        }
                    }
                });
                popup.add(defaultItem);
                defaultItem = new MenuItem("Change Wallpaper");
                defaultItem.addActionListener(new ActionListener() {
                    public void actionPerformed(ActionEvent e) {
                        try {
                            ProcessBuilder pb = new ProcessBuilder(path + "/wallpaperchange.sh");
                            Process p = pb.start();
                            BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
                            String line = null;
                            while ((line = reader.readLine()) != null) {
                                System.out.println(line);
                            }
                        } catch (IOException ex) {
                        }
                    }
                });
                popup.add(defaultItem);
                defaultItem = new MenuItem("Remove this Wallpaper");
                defaultItem.addActionListener(new ActionListener() {
                    public void actionPerformed(ActionEvent e) {
                        try {
                            ProcessBuilder pb = new ProcessBuilder(path + "/removeCurrent.sh");
                            Process p = pb.start();
                            BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
                            String line = null;
                            while ((line = reader.readLine()) != null) {
                                System.out.println(line);
                            }
                        } catch (IOException ex) {
                        }
                        try {
                            ProcessBuilder pb = new ProcessBuilder(path + "/wallpaperchange.sh");
                            Process p = pb.start();
                            BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
                            String line = null;
                            while ((line = reader.readLine()) != null) {
                                System.out.println(line);
                            }
                        } catch (IOException ex) {
                        }
                    }
                });
                popup.add(defaultItem);
                defaultItem = new MenuItem("Exit");
                defaultItem.addActionListener(new ActionListener() {
                    public void actionPerformed(ActionEvent e) {
                        System.out.println("Exiting");
                        System.exit(0);
                    }
                });
                popup.add(defaultItem);
                trayIcon = new TrayIcon(image, "Wallpapers", popup);
                trayIcon.setImageAutoSize(true);
            } else {
                System.out.println("system tray not supported");
                System.exit(0);
            }
            tray.add(trayIcon);
            setVisible(false);

            setIconImage(Toolkit.getDefaultToolkit().getImage("icon.png"));

            setSize(300, 200);
            setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            UIManager.setLookAndFeel("com.sun.java.swing.plaf.gtk.GTKLookAndFeel");
        } catch (Exception e){
        }
    }

    public static void main(String[] args) {
        new Linuxwallpaper();
    }
}
