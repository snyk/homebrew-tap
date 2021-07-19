class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.663.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.663.0/snyk-macos"
    sha256 "32cfde6f7855587a45e2cd0e2db3abbe99c6286471a092faba53126ee89ef44d"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.663.0/snyk-linux"
    sha256 "7c12e0991b15795c0913688edf00fff0cafae12c090170804b711b528882f04a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
