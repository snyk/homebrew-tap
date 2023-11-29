class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1257.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1257.0/snyk-macos"
    sha256 "6a50c10d7319f16c06c1687771594f992e0706c341db323bb8e2ebf9eb699873"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1257.0/snyk-macos-arm64"
    sha256 "194398a72252b238ac6d95d6923c61c4eb5fe32c50d0b3ae8b21307d5d6cee06"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1257.0/snyk-linux"
    sha256 "f98b7bc430b5755bd24190e952a8353a756c3e726f427e10b42bac971cd2cb01"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1257.0/snyk-linux-arm64"
    sha256 "94628da87f2f9e0e5ca4fc580aff402e4f40453e1f161f0c0de7ff783dc6d434"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
