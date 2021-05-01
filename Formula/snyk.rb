class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.574.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.574.0/snyk-macos"
    sha256 "bd619be87d8d78214955ed2ba582a96e28041de30d1e505a81a767bf0987ba00"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.574.0/snyk-linux"
    sha256 "011fcfc4eb9efea1537b35fcff080d2e78bb36968a4edd00076d720bf8fd25a2"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
