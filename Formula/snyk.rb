class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.303.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.303.0/snyk-macos"
    sha256 "8e5f01b6690fd2d18d1c384464afee3f4b9b18cc9f921c4be540a69a082c19c3"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.303.0/snyk-linux"
    sha256 "a14c84b7d18ec47161264d255d66ec298c8aaaba9ff11c49c202e09578d53b34"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
