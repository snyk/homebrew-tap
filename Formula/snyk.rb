class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.729.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.729.0/snyk-macos"
    sha256 "1cf7a53b58c3e80c358fc21dba334a43baf7c7aca0a74189220cd763aa1dc6dc"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.729.0/snyk-linux"
    sha256 "2eaf8c62831a1658c95d41fdc683cd177c147733c64a93e59cb2362829e45b7d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
