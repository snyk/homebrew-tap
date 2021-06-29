class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.650.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.650.0/snyk-macos"
    sha256 "b94ca848e040eb676d64c74b7a7065826cf0870c9c1cab5dbd39b09cd5712a6f"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.650.0/snyk-linux"
    sha256 "5e95b173a397bde4874365d2059ee394cd2b95a7bc9096ad15f9c477ac84028b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
