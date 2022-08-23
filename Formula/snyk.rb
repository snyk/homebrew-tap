class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.990.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.990.0/snyk-macos"
    sha256 "42e910a8b985d66b5822b0daf279351f906c67640e1c9b1bef215ae91849f18d"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.990.0/snyk-linux"
    sha256 "86368db71300275da805cb7884c92ff0fcd02d2830ca49b368325af9e2cae82f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
