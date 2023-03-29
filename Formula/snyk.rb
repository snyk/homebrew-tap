class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1129.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1129.0/snyk-macos"
    sha256 "faa461a49171f21863257a508fd7ebdc8a10f4ec87433e181c16b280b5531e12"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1129.0/snyk-linux"
    sha256 "abe210e339ef4fd5ec0e9b4c3352294f02e740525b22c9e9ecf9390c258cd630"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
