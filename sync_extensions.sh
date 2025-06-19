# Read desired extensions
desired_extensions=$(cat vscode-extensions.txt)

# Get currently installed extensions
installed_extensions=$(code --list-extensions)

# Uninstall extensions not in the list
for ext in $installed_extensions; do
    if ! echo "$desired_extensions" | grep -Fxq "$ext"; then
        echo "Uninstalling: $ext"
        code --uninstall-extension "$ext"
    fi
done

# Install missing desired extensions
for ext in $desired_extensions; do
    if ! echo "$installed_extensions" | grep -Fxq "$ext"; then
        echo "Installing: $ext"
        code --install-extension "$ext"
    fi
done
