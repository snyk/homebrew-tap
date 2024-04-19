class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1290.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1290.0/snyk-macos"
    sha256 "444d34ea96f6f0819208050d77cc0ae99836e59af7534fa48e0233737654325a"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1290.0/snyk-macos-arm64"
    sha256 "1a5fd52e6db8961c7249382c6eac85a51c2c8a189827896bf1ef2c17714bcee4"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1290.0/snyk-linux"
    sha256 "380a7b4246db2c6ff922fd7457445032c085cf5e54613ddf9b736e467ca3d8e7"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1290.0/snyk-linux-arm64"
    sha256 "50172431a80d699a3aa504a5017f64bee8bf5bb586cfa531207c5350155d2f0d"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
