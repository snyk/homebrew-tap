class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1289.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1289.0/snyk-macos"
    sha256 "bfdbab8bbf53bd8229fe450ed73658a6c5104719bf6a6b690e740a465283f7bd"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1289.0/snyk-macos-arm64"
    sha256 "f9c73120e8fd3480ca4145c46c4882aaf9169526a309deacf21db3e111e5fdb4"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1289.0/snyk-linux"
    sha256 "026ea193bb46d8d027ffbe29d01a82fd16797cee728e1137985ad55653ff99de"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1289.0/snyk-linux-arm64"
    sha256 "a57e6d54b847943888f94d78a99c4c1aaf2d620c2aad9e06c2bc4d0a8809f58d"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
