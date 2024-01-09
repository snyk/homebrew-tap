class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1268.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1268.0/snyk-macos"
    sha256 "6cee2069c105fc2db982038bd4a11d58044091c0c94edd8f7751e75df3b380fe"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1268.0/snyk-macos-arm64"
    sha256 "55333a24d587c3df015bb589868de14d3ba965c2b801103c45de28721a8c4576"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1268.0/snyk-linux"
    sha256 "3676e4056f9a2a9c8408a006e320fff928cd111b5e70c9448e3265baa0612a64"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1268.0/snyk-linux-arm64"
    sha256 "c0a2e276a26b0cb0e5ea836e40a3e9b24be6f93db2afad18fe7116a3d75e56fd"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
