@echo off
REM ========================================================================
REM Скрипт для удаления неиспользуемых файлов авторизации Microsoft
REM ========================================================================
REM ВНИМАНИЕ: Этот скрипт удалит файлы безвозвратно!
REM Используйте только если вы уверены!
REM ========================================================================

echo.
echo ========================================================================
echo   ОЧИСТКА НЕИСПОЛЬЗУЕМЫХ ФАЙЛОВ АВТОРИЗАЦИИ MICROSOFT
echo ========================================================================
echo.
echo ВНИМАНИЕ! Этот скрипт удалит следующие файлы:
echo.
echo   - MSALoginDialog (окно входа Microsoft)
echo   - ProfileSelectDialog (выбор аккаунта)
echo   - ProfileSetupDialog (настройка профиля)
echo   - LoginWizardPage (страница входа в мастере)
echo   - AuthFlow (процесс авторизации)
echo   - MSAStep, MSADeviceCodeStep, XboxAuthorizationStep
echo   - LauncherLoginStep, EntitlementsStep
echo.
echo ========================================================================
echo.

set /p confirm="Вы уверены что хотите удалить эти файлы? (yes/no): "
if /i not "%confirm%"=="yes" (
    echo Отменено пользователем.
    pause
    exit /b 0
)

echo.
echo Удаление файлов...
echo.

REM Диалоги
del /q "launcher\ui\dialogs\MSALoginDialog.cpp" 2>nul
del /q "launcher\ui\dialogs\MSALoginDialog.h" 2>nul
del /q "launcher\ui\dialogs\MSALoginDialog.ui" 2>nul

del /q "launcher\ui\dialogs\ProfileSelectDialog.cpp" 2>nul
del /q "launcher\ui\dialogs\ProfileSelectDialog.h" 2>nul
del /q "launcher\ui\dialogs\ProfileSelectDialog.ui" 2>nul

del /q "launcher\ui\dialogs\ProfileSetupDialog.cpp" 2>nul
del /q "launcher\ui\dialogs\ProfileSetupDialog.h" 2>nul
del /q "launcher\ui\dialogs\ProfileSetupDialog.ui" 2>nul

REM LoginWizardPage
del /q "launcher\ui\setupwizard\LoginWizardPage.cpp" 2>nul
del /q "launcher\ui\setupwizard\LoginWizardPage.h" 2>nul
del /q "launcher\ui\setupwizard\LoginWizardPage.ui" 2>nul

REM AuthFlow
del /q "launcher\minecraft\auth\AuthFlow.cpp" 2>nul
del /q "launcher\minecraft\auth\AuthFlow.h" 2>nul

REM Auth Steps
del /q "launcher\minecraft\auth\steps\MSAStep.cpp" 2>nul
del /q "launcher\minecraft\auth\steps\MSAStep.h" 2>nul

del /q "launcher\minecraft\auth\steps\MSADeviceCodeStep.cpp" 2>nul
del /q "launcher\minecraft\auth\steps\MSADeviceCodeStep.h" 2>nul

del /q "launcher\minecraft\auth\steps\XboxAuthorizationStep.cpp" 2>nul
del /q "launcher\minecraft\auth\steps\XboxAuthorizationStep.h" 2>nul

del /q "launcher\minecraft\auth\steps\XboxUserStep.cpp" 2>nul
del /q "launcher\minecraft\auth\steps\XboxUserStep.h" 2>nul

del /q "launcher\minecraft\auth\steps\LauncherLoginStep.cpp" 2>nul
del /q "launcher\minecraft\auth\steps\LauncherLoginStep.h" 2>nul

del /q "launcher\minecraft\auth\steps\EntitlementsStep.cpp" 2>nul
del /q "launcher\minecraft\auth\steps\EntitlementsStep.h" 2>nul

del /q "launcher\minecraft\auth\steps\MinecraftProfileStep.cpp" 2>nul
del /q "launcher\minecraft\auth\steps\MinecraftProfileStep.h" 2>nul

del /q "launcher\minecraft\auth\steps\GetSkinStep.cpp" 2>nul
del /q "launcher\minecraft\auth\steps\GetSkinStep.h" 2>nul

echo.
echo ========================================================================
echo   Файлы удалены!
echo ========================================================================
echo.
echo ВНИМАНИЕ: Теперь нужно удалить эти файлы из CMakeLists.txt
echo Откройте файл launcher\CMakeLists.txt и удалите строки с этими файлами
echo.
echo После этого перекомпилируйте проект:
echo   cd build
echo   cmake ..
echo   cmake --build . --config Release
echo.
echo ========================================================================
pause
