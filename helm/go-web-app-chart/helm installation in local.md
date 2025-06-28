✅ # Method: Install via APT (Official Helm repo)
Use this method if you want to manage Helm via apt (Debian package manager)

Step-by-step:
bash

# 1. Update and install required packages
        sudo apt update
        sudo apt install -y apt-transport-https curl

# 2. Add Helm's GPG key
        curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -

# 3. Add the Helm APT repository
        echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

# 4. Update package index and install Helm
        sudo apt update
        sudo apt install helm -y
🧪 Verify Helm Installation
        bash
        Copy code
        helm version
        You should see output like:

css
Copy code
version.BuildInfo{Version:"v3.14.0", ...}
