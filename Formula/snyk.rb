class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.661.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.661.0/snyk-macos"
    sha256 "35355d49cc82bfcefd4b0079051b9f4b6f26cd5c371316ef1e3f99fed6bc32e5"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.661.0/snyk-linux"
    sha256 "8a19224ec587ce007cd27f487192332b1d82a7147a4c77bb9e4b52f811379536"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
