class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1307.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1307.4/snyk-macos?utm_source=HOMEBREW"
    sha256 "ed500e5fe8b61060f5df7fe781c7c9a3d1fb7bad23f413777efb21c6263836c6"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1307.4/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "31a07d915fba0c24e3b60716f22c8a18cdb1e9b9590546fc1ef21c92309ab7fb"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1307.4/snyk-linux?utm_source=HOMEBREW"
    sha256 "b0baee4fa4d7d11b7df927a1046cf8137a8a89fafac8101a45c3c0e0777ddc35"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1307.4/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "694c014c1d0db25b481092fd7df6edf6e01449d5ab7b043843a6fb41c141ba08"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
