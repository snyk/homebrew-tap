class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.495.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.495.0/snyk-macos"
    sha256 "db2b22ba7b90bccd00839562a13873cd4104ec6ef72f7f5c9ef0de6b352619f7"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.495.0/snyk-linux"
    sha256 "a1236c23a5d665c9685a2bc2bfd31a3f1eedf4606dcfc42c789b56eed65acdc8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
