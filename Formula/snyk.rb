class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1110.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1110.0/snyk-macos"
    sha256 "828a3dffc75ee98709dc3dccc860d01c8084ebfcf2590b732d9a6cdde696c368"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1110.0/snyk-linux"
    sha256 "1c4f45e2d9dad749613669151b21ff8ef51251a99ff0acfd2d477ed1795b191b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
