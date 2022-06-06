var plasma = getApiVersion(1);

var layout = {
    "desktops": [
        {
            "applets": [
                {
                    "config": {
                        "/": {
                            "PreloadWeight": "0"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "480",
                            "DialogWidth": "640"
                        },
                        "/General": {
                            "fontFamily": "Open Sans Condensed Light"
                        }
                    },
                    "geometry.height": 0,
                    "geometry.width": 0,
                    "geometry.x": 0,
                    "geometry.y": 0,
                    "plugin": "org.kde.NowPlaying",
                    "title": "NowPlaying"
                }
            ],
            "config": {
                "/": {
                    "ItemGeometriesHorizontal": "Applet-219:32,880,400,80,0;",
                    "formfactor": "0",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                },
                "/ConfigDialog": {
                    "DialogHeight": "736",
                    "DialogWidth": "1472"
                },
                "/Configuration": {
                    "PreloadWeight": "0"
                },
                "/General": {
                    "ToolBoxButtonState": "topcenter",
                    "ToolBoxButtonX": "455"
                },
                "/Wallpaper/org.kde.color/General": {
                    "Color": "255,255,255"
                },
                "/Wallpaper/org.kde.image/General": {
                    "Image": "file:///media/Datos/wallpapers/wavy_lines_v02_5120x2880.png",
                    "SlidePaths": ""
                },
                "/Wallpaper/smartvideowallpaper/General": {
                    "DoublePlayer": "false",
                    "MuteAudio": "false",
                    "VideoWallpaperBackgroundVideo": "file:///media/Datos/videos/mylivewallpapers.com-Mandalorian-Beskar-Armor-Baby-Yoda.mp4",
                    "checkedBusyPlay": "false",
                    "checkedSmartPlay": "true"
                }
            },
            "wallpaperPlugin": "org.kde.image"
        }
    ],
    "panels": [
    ],
    "serializationFormatVersion": "1"
}
;

plasma.loadSerializedLayout(layout);
