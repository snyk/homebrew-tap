class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.787.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.787.0/snyk-macos"
    sha256 "de9a24e07de45c896d352156e718535a6513826b01131993de03d262b56de3ee"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.787.0/snyk-linux"
    sha256 "aac929fb1d662c33f75df6f0d63426f6a269f83001fd253ca9970f9f6bf661fc"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
