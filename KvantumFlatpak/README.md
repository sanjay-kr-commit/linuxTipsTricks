# KvantumSyncForFlatpak

**install flatpak kvantum theme**

    flatpak install kvantum

select both qt version 5 and 6

**override theme **

    sudo flatpak override --env=QT_STYLE_OVERRIDE=kvantum --filesystem=xdg-config/Kvantum:ro
