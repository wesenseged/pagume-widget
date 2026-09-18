/*
SPDX-FileCopyrightText: 2026 Abenezer Wesenseged <wseged@proton.me>
SPDX-License-Identifier: GPL-3.0-or-later
*/

import QtQuick 2.12
import org.kde.plasma.configuration 2.0

ConfigModel {
    ConfigCategory {
        name: i18n("General")
        icon: "preferences-desktop"
        source: "GeneralConfig.qml"
    }
}
