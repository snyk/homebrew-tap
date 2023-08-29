class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1207.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1207.0/snyk-macos"
    sha256 "6a52d9e8cf9c0b33f6b82b2324d208a62d8a1a9145b87c3f0cd167113c2db03e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1207.0/snyk-linux"
    sha256 "f5f3435098983b8a753c4264f7ceb09de12a1b3be38ad1316d200652ea4dabf7"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
