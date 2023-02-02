class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1094.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1094.0/snyk-macos"
    sha256 "323444196bb961d48ae29b527e654b2ed37c54bf46f278d8177e674ca26893f1"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1094.0/snyk-linux"
    sha256 "d4e47d90c8a590aa3e751a4ee12edb7b9aa2eade2b0e4ec3da3f6d8485dbdf83"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
