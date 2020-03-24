class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.303.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.303.1/snyk-macos"
    sha256 "fbd15bfa48f86aeec05b1a947f2577f20f7e0e4f0bf15519c391943199b870cf"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.303.1/snyk-linux"
    sha256 "85ba47c935181f64412cfcecf9b8fecafd23afbf00aa42d75c56f2df55b3a23b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
