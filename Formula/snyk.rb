class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.736.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.736.0/snyk-macos"
    sha256 "0a9cf10326d21ad959d83ab754317bb280cbad8292dabe2528254fbdb3ef55af"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.736.0/snyk-linux"
    sha256 "6307d88dbef7d857970c75535b4b9316f0c4a63af6d63816367755202f9dc239"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
