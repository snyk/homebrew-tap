class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1176.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1176.0/snyk-macos"
    sha256 "c1c72724cf092a3fb042d006550981f193d3dd025b28aec3eccbf505274fe377"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1176.0/snyk-linux"
    sha256 "ab0f168ccd64b836c484c63399a2a6461ec4958716bb543c5a78a407db6e4ae7"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
